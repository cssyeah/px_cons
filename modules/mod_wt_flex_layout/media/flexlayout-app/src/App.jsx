import { Dialog, DialogPanel } from "@headlessui/react";
import { useState } from "react";
import Container from "./components/Container";

export default () => {
  const [isOpen, setIsOpen] = useState(false);
  const data = Joomla.getOptions("flexlayout-data");
  const styles = data.styles;
  const value = data.value;
  const active = styles.find((style) => style.value === value);

  return (
    <>
      <div className="field-layout">
        {active && (
          <div className="layout-wrap">
            <h3 className="layout-name">{active.title}</h3>
            <div className="layout-thumbs">
              <img
                src={active.preview.url}
                width={active.preview.width}
                height={active.preview.height}
                onClick={() => setIsOpen(true)}
              />
            </div>
          </div>
        )}
        <button type="button" onClick={() => setIsOpen(true)} className="btn btn-success">
          Select Layout
        </button>
      </div>
      <Dialog
        open={isOpen}
        onClose={() => setIsOpen(false)}
        className="style-picker-dialog-wrapper"
      >
        <div className="style-picker-dialog-container">
          <DialogPanel className="style-picker-dialog-panel border">
            <Container setIsOpen={setIsOpen} />
          </DialogPanel>
        </div>
      </Dialog>
    </>
  );
};
